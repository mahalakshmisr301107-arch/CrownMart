-- Passwords below are bcrypt hashes (jBCrypt-compatible, $2a$ prefix, cost 12).
-- All demo users share the same password: crownmart123
-- Plaintext demo passwords are documented in README.md - never store plaintext.

INSERT INTO users (name, email, password_hash, role, created_at) VALUES
    ('Asha Buyer',       'buyer1@crownmart.test',  '$2a$12$f1EfE.BRXJClewvllIXPRuT3YtlMk8a4.K90Jl6fuccx/HwJrTxTa', 'BUYER',  CURRENT_TIMESTAMP),
    ('Ravi Buyer',       'buyer2@crownmart.test',  '$2a$12$f1EfE.BRXJClewvllIXPRuT3YtlMk8a4.K90Jl6fuccx/HwJrTxTa', 'BUYER',  CURRENT_TIMESTAMP),
    ('Meera Seller',     'seller1@crownmart.test', '$2a$12$f1EfE.BRXJClewvllIXPRuT3YtlMk8a4.K90Jl6fuccx/HwJrTxTa', 'SELLER', CURRENT_TIMESTAMP),
    ('Karthik Seller',   'seller2@crownmart.test', '$2a$12$f1EfE.BRXJClewvllIXPRuT3YtlMk8a4.K90Jl6fuccx/HwJrTxTa', 'SELLER', CURRENT_TIMESTAMP),
    ('adminMahalakshmi', 'admin@crownmart.test',   '$2a$12$f1EfE.BRXJClewvllIXPRuT3YtlMk8a4.K90Jl6fuccx/HwJrTxTa', 'ADMIN',  CURRENT_TIMESTAMP);

-- seller1 (Meera Seller, id=3) products - Electronics
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, created_at) VALUES
    (3, 'Wireless Mouse', 'Ergonomic 2.4GHz wireless mouse with USB receiver.', 599.00, 50, 'Electronics', 'https://images.pexels.com/photos/7172700/pexels-photo-7172700.jpeg', CURRENT_TIMESTAMP),
    (3, 'USB-C Charger 65W', 'Fast-charging GaN wall charger with USB-C PD.', 1299.00, 30, 'Electronics', 'https://images.pexels.com/photos/32710069/pexels-photo-32710069.jpeg', CURRENT_TIMESTAMP),
    (3, 'Bluetooth Headphones', 'Over-ear headphones with 30-hour battery life.', 2499.00, 20, 'Electronics', 'https://images.pexels.com/photos/30345418/pexels-photo-30345418.jpeg', CURRENT_TIMESTAMP);

-- seller2 (Karthik Seller, id=4) products - Home & Kitchen
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, created_at) VALUES
    (4, 'Stainless Steel Water Bottle', 'Insulated 1L bottle, keeps drinks cold for 24 hours.', 449.00, 100, 'Home & Kitchen', 'https://images.pexels.com/photos/25382222/pexels-photo-25382222.jpeg', CURRENT_TIMESTAMP),
    (4, 'Plates', 'Set of durable ceramic dinner plates, dishwasher and microwave safe.', 799.00, 60, 'Home & Kitchen', 'https://images.pexels.com/photos/7671231/pexels-photo-7671231.jpeg', CURRENT_TIMESTAMP),
    (4, 'Handcrafted Kitchen Utensil Set', 'Durable acacia wood utensil set including a straining spoon, slotted turner, and salad tongs, stored in a matching wooden caddy.', 349.00, 40, 'Home & Kitchen', 'https://images.pexels.com/photos/30798748/pexels-photo-30798748.jpeg', CURRENT_TIMESTAMP);