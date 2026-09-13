-- Passwords below are bcrypt hashes (jBCrypt-compatible, $2a$ prefix, cost 12).
-- Plaintext demo passwords are documented in README.md - never store plaintext.

INSERT INTO users (name, email, password_hash, role, created_at) VALUES
    ('Asha Buyer',  'buyer1@crownmart.test',  '$2a$12$O0GMzmV1kW6kgc3MU1sNz.HWuJR5wCh781S5LTnjjgVYvbC78PR8.', 'BUYER',  CURRENT_TIMESTAMP),
    ('Ravi Buyer',  'buyer2@crownmart.test',  '$2a$12$YFYls6hCsKUdUS0fMOCNQOxjYCBq8aU24Po/bphnjYG7I/INTA6Ly', 'BUYER',  CURRENT_TIMESTAMP),
    ('Meera Seller','seller1@crownmart.test', '$2a$12$csagYPAkzqmInydk7Rzdme/wBSqKK1jeTN77LdZskQfF936aVyWZS', 'SELLER', CURRENT_TIMESTAMP),
    ('Karthik Seller','seller2@crownmart.test','$2a$12$JEKuM5YUN01MKoDkRtTPruh5DUFf/00Tep7sFpFPRHyxSgzV1NyVG', 'SELLER', CURRENT_TIMESTAMP);

-- seller1 (Meera Seller, id=3) products - Electronics
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, created_at) VALUES
    (3, 'Wireless Mouse', 'Ergonomic 2.4GHz wireless mouse with USB receiver.', 599.00, 50, 'Electronics', 'https://picsum.photos/seed/mouse/400', CURRENT_TIMESTAMP),
    (3, 'USB-C Charger 65W', 'Fast-charging GaN wall charger with USB-C PD.', 1299.00, 30, 'Electronics', 'https://picsum.photos/seed/charger/400', CURRENT_TIMESTAMP),
    (3, 'Bluetooth Headphones', 'Over-ear headphones with 30-hour battery life.', 2499.00, 20, 'Electronics', 'https://picsum.photos/seed/headphones/400', CURRENT_TIMESTAMP);

-- seller2 (Karthik Seller, id=4) products - Home & Kitchen
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, created_at) VALUES
    (4, 'Stainless Steel Water Bottle', 'Insulated 1L bottle, keeps drinks cold for 24 hours.', 449.00, 100, 'Home & Kitchen', 'https://picsum.photos/seed/bottle/400', CURRENT_TIMESTAMP),
    (4, 'Non-Stick Frying Pan', '28cm non-stick frying pan, induction compatible.', 899.00, 40, 'Home & Kitchen', 'https://picsum.photos/seed/pan/400', CURRENT_TIMESTAMP),
    (4, 'Cotton Bedsheet Set', 'Queen-size 100% cotton bedsheet with 2 pillow covers.', 1099.00, 25, 'Home & Kitchen', 'https://picsum.photos/seed/bedsheet/400', CURRENT_TIMESTAMP);
