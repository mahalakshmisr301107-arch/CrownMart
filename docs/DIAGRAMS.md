# CrownMart: Design Diagrams

Diagrams D1 to D3 required by the project specification (Section 5).

## D1. ER Diagram

Derived from `schema.sql`. All monetary fields are `DECIMAL(10,2)`, every foreign key is indexed, and `users.email` is unique.

```mermaid
erDiagram
    USERS ||--o{ PRODUCTS : "sells (seller\_id)"
    USERS ||--o{ ORDERS : "places (buyer\_id)"
    USERS ||--o{ CART\_ITEMS : "has (user\_id)"
    USERS ||--o{ REVIEWS : "writes (user\_id)"
    ORDERS ||--|{ ORDER\_ITEMS : "contains (order\_id)"
    PRODUCTS ||--o{ ORDER\_ITEMS : "ordered as (product\_id)"
    PRODUCTS ||--o{ CART\_ITEMS : "added as (product\_id)"
    PRODUCTS ||--o{ REVIEWS : "receives (product\_id)"

    USERS {
        BIGINT id PK
        VARCHAR name
        VARCHAR email UK
        VARCHAR password\_hash
        VARCHAR role "BUYER | SELLER | ADMIN"
        TIMESTAMP created\_at
    }
    PRODUCTS {
        BIGINT id PK
        BIGINT seller\_id FK
        VARCHAR name
        CLOB description
        DECIMAL price
        INT stock\_qty
        VARCHAR category
        VARCHAR image\_url
        TIMESTAMP created\_at
    }
    ORDERS {
        BIGINT id PK
        BIGINT buyer\_id FK
        VARCHAR status "PENDING | CONFIRMED | SHIPPED | DELIVERED | CANCELLED"
        DECIMAL total\_amount
        TIMESTAMP created\_at
    }
    ORDER\_ITEMS {
        BIGINT id PK
        BIGINT order\_id FK
        BIGINT product\_id FK
        INT quantity
        DECIMAL unit\_price
    }
    CART\_ITEMS {
        BIGINT id PK
        BIGINT user\_id FK
        BIGINT product\_id FK
        INT quantity
        TIMESTAMP created\_at
    }
    REVIEWS {
        BIGINT id PK
        BIGINT product\_id FK
        BIGINT user\_id FK
        INT rating "1 to 5"
        VARCHAR comment
        TIMESTAMP created\_at
    }
```

## D2. Use Case Diagram

Actors and use cases map to feature requirements F1 to F8. The Admin account is created by seed data only (no signup flow).

```mermaid
flowchart LR
    Buyer(\[Buyer])
    Seller(\[Seller])
    Admin(\[Admin])

    subgraph CrownMart\["CrownMart System"]
        direction TB
        UC1(Register / Login - F1)
        UC2(Browse products - F3)
        UC3(Search and filter by category / keyword - F3)
        UC4(Add / update / remove cart items - F4)
        UC5(Checkout with mock payment - F5)
        UC6(View order history and status - F6)
        UC7(Review and rate product - F8)
        UC8(Create / edit / delete product listing - F2)
        UC9(View incoming orders for own products - F6)
        UC10(View all users - F7)
        UC11(View all orders - F7)
        UC12(Moderate / remove listings - F7)
    end

    Buyer --- UC1
    Buyer --- UC2
    Buyer --- UC3
    Buyer --- UC4
    Buyer --- UC5
    Buyer --- UC6
    Buyer --- UC7

    Seller --- UC1
    Seller --- UC8
    Seller --- UC9

    Admin --- UC1
    Admin --- UC10
    Admin --- UC11
    Admin --- UC12
```

## D3. Sequence Diagram: Place Order

Browser to Servlet to Service to DAO to Database, including the response path. The DAO layer gets connections from the HikariCP pool created by the `ServletContextListener`. Adjust class names if yours differ slightly.

```mermaid
sequenceDiagram
    autonumber
    actor Buyer as Buyer (Browser)
    participant F as AuthFilter
    participant S as OrderServlet
    participant SV as OrderService
    participant CD as CartDao
    participant PD as ProductDao
    participant OD as OrderDao
    participant DB as H2 Database (via HikariCP)

    Buyer->>F: POST /checkout (mock payment confirmed)
    F->>F: Validate HttpSession (logged-in user)
    alt No valid session
        F-->>Buyer: 302 Redirect to /login
    else Session valid
        F->>S: doPost(request, response)
        S->>SV: placeOrder(userId)
        SV->>CD: findByUserId(userId)
        CD->>DB: SELECT \* FROM cart\_items WHERE user\_id = ?
        DB-->>CD: cart rows
        CD-->>SV: List of CartItem
        alt Cart is empty
            SV-->>S: ValidationException
            S-->>Buyer: Error message (cart is empty)
        else Cart has items
            SV->>PD: findById(productId) for each item
            PD->>DB: SELECT \* FROM products WHERE id = ?
            DB-->>PD: product row (price, stock\_qty)
            PD-->>SV: Product
            SV->>SV: Check stock, compute total\_amount
            SV->>OD: begin transaction, insert order
            OD->>DB: INSERT INTO orders (buyer\_id, status, total\_amount, created\_at)
            DB-->>OD: generated order id
            OD->>DB: INSERT INTO order\_items (order\_id, product\_id, quantity, unit\_price)
            SV->>PD: decrementStock(productId, qty)
            PD->>DB: UPDATE products SET stock\_qty = stock\_qty - ? WHERE id = ?
            SV->>CD: clearCart(userId)
            CD->>DB: DELETE FROM cart\_items WHERE user\_id = ?
            SV->>DB: commit
            DB-->>SV: OK
            SV-->>S: Order (id, status, total)
            S-->>Buyer: 302 Redirect to /orders (order confirmation)
        end
    end
```

