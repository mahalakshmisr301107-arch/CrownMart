# CrownMart — MVP (Review 1)

A multi-seller e-commerce marketplace web app built with Java Servlets, JDBC, and Tomcat,
for an Anna University R2025 Semester 3 capstone project.

## Scope covered in this MVP

1. User registration and login (BUYER / SELLER roles), session-based auth
2. Sellers can create product listings
3. Buyers can browse and search products by keyword and category
4. Cart: add / update quantity / remove, running total
5. Checkout via a mock "Confirm Payment" step (no real payment gateway)
6. Order history for buyers

Out of scope for this MVP (planned for later reviews): seller dashboard, admin panel,
reviews, AI chatbot.

## Tech stack

JDK 17 &middot; Tomcat 9.0.x &middot; Servlet API `javax.servlet.*` &middot; Maven &middot;
H2 (file-based embedded DB) &middot; HikariCP &middot; JSP + JSTL &middot; Gson &middot;
jBCrypt &middot; SLF4J + Logback

## How to build

```bash
mvn clean package
```

This produces `target/crownmart.war`.

## How to deploy to Tomcat 9

1. Copy `target/crownmart.war` into `<TOMCAT_HOME>/webapps/`.
2. Start Tomcat: `<TOMCAT_HOME>/bin/startup.sh` (or `startup.bat` on Windows).
3. Tomcat will explode the WAR and deploy it at context path `/crownmart`.
4. Visit `http://localhost:8080/crownmart/`.

On first startup, the app creates an H2 database file under `./data/crownmart.mv.db`
(relative to Tomcat's working directory), applies `schema.sql`, and loads `seed.sql`
if the `users` table is empty. Restarting Tomcat will not duplicate the seed data.

> If you'd rather run against a pure in-memory DB that resets on every restart, change
> the JDBC URL in `DataSourceListener` to `jdbc:h2:mem:crownmart;DB_CLOSE_DELAY=-1`.

## Running the tests

```bash
mvn test
```

This runs the JUnit 5 DAO tests against a fresh in-memory H2 instance (`jdbc:h2:mem:test_*`)
created and torn down per test class — it does not touch the file-based dev/prod database.

## Seeded demo accounts

| Role   | Email                     | Password      |
|--------|----------------------------|---------------|
| Buyer  | buyer1@crownmart.test       | buyerpass1    |
| Buyer  | buyer2@crownmart.test       | buyerpass2    |
| Seller | seller1@crownmart.test      | sellerpass1   |
| Seller | seller2@crownmart.test      | sellerpass2   |

Six sample products are seeded across two categories (Electronics, Home & Kitchen),
split between the two seller accounts.

## Project layout

```
com.crownmart.app
|-- controller   Servlets — thin, HTTP orchestration only
|-- service      Business rules (registration, cart math, checkout, stock validation)
|-- dao          DAO interfaces + JDBC implementations (PreparedStatement everywhere)
|-- model        POJO entities
|-- dto          Request/response shapes
|-- filter       AuthFilter (session + role guard), EncodingFilter (UTF-8)
|-- listener     DataSourceListener — owns the HikariCP pool lifecycle
|-- util         PasswordUtil (bcrypt), ValidationUtil, JsonUtil
`-- exception    ValidationException, AuthenticationException, BusinessRuleException, DataAccessException
```

## Key engineering notes

- Every SQL statement uses `PreparedStatement`; no string concatenation.
- Passwords are hashed with jBCrypt (cost factor 12); plaintext is never stored or logged.
- Login regenerates the session (old session invalidated, new one created) to prevent
  session fixation, with an explicit 30-minute inactivity timeout.
- All user-supplied output is escaped in JSP views via `<c:out>`.
- The HikariCP connection pool is created and closed exclusively by `DataSourceListener`;
  no other class calls `DriverManager.getConnection()`.
- Every `Connection` / `PreparedStatement` / `ResultSet` is opened in try-with-resources.
- Order placement (order + order_items) runs inside a single JDBC transaction with
  manual commit/rollback so a partial order can never be persisted.
- Servlets stay thin; business logic lives in `service`, which depends on DAO
  **interfaces**, never concrete JDBC classes.
