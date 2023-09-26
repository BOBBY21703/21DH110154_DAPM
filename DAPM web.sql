create database Beat;
go
use Beat;

-- Tạo bảng Thể loại âm nhạc (Genres)
CREATE TABLE Genres (
  genre_id INT PRIMARY KEY,
  name VARCHAR(100)
);

-- Tạo bảng Nghệ sĩ/Producer (Artists)
CREATE TABLE Artists (
  artist_id INT PRIMARY KEY,
  name VARCHAR(100),
  bio TEXT
);

-- Tạo bảng Beat (Beats)
CREATE TABLE Beats (
  beat_id INT PRIMARY KEY,
  title VARCHAR(100),
  artist_id INT,
  genre_id INT,
  price DECIMAL(10, 2),
  release_date DATE,
  description TEXT,
  file_path VARCHAR(255),
  FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
  FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

-- Tạo bảng Khách hàng (Customers)
CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100),
  password VARCHAR(255),
  address VARCHAR(255),
  phone_number VARCHAR(20)
);

-- Tạo bảng Đơn hàng (Orders)
CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  total_amount DECIMAL(10, 2),
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Tạo bảng Chi tiết đơn hàng (OrderDetails)
CREATE TABLE OrderDetails (
  order_detail_id INT PRIMARY KEY,
  order_id INT,
  beat_id INT,
  quantity INT,
  subtotal DECIMAL(10, 2),
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (beat_id) REFERENCES Beats(beat_id)
);


-- Tạo bảng Thanh toán trực tuyến (OnlinePayments)
CREATE TABLE OnlinePayments (
  payment_id INT PRIMARY KEY,
  order_id INT,
  payment_date DATETIME,
  payment_method VARCHAR(50),
  amount DECIMAL(10, 2),
  transaction_id VARCHAR(255),
  FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Chèn dữ liệu vào bảng Genres
INSERT INTO Genres (genre_id, name)
VALUES
  (1, 'Hip-Hop'),
  (2, 'R&B'),
  (3, 'Pop'),
  (4, 'Rock'),
  (5, 'Drill');


  -- Chèn dữ liệu vào bảng Artists
INSERT INTO Artists (artist_id, name, bio)
VALUES
  (1, 'BOBBY', 'PRODUCER'),
  (2, 'NARKIE', 'PRODUCER'),
  (3, 'TOOT', 'PRODUCER'),
  (4, 'STARRY B', 'PRODUCER'),
  (5, 'BEATER', 'PRODUCER');


-- Chèn dữ liệu vào bảng Beats
INSERT INTO Beats (beat_id, title, artist_id, genre_id, price, release_date, description, file_path)
VALUES
  (1, 'Beat 1', 1, 1, 19.99, '2023-09-15', 'DRAKE type beat', 'path/to/beat1.mp3'),
  (2, 'Beat 2', 2, 2, 24.99, '2023-09-16', 'SZA type beat', 'path/to/beat2.mp3'),
  (3, 'Beat 3', 3, 3, 14.99, '2023-09-17', 'Post Malone type beat', 'path/to/beat3.mp3'),
  (4, 'Beat 4', 4, 4, 24.99, '2023-09-17', 'MGK type beat', 'path/to/beat4.mp3'),
  (5, 'Beat 5', 5, 5, 19.99, '2023-09-17', 'Pop Smoke type beat', 'path/to/beat5.mp3');

-- Chèn dữ liệu vào bảng Orders
INSERT INTO Orders (order_id, customer_id, order_date, total_amount)
VALUES
  (1, 1, '2023-09-25', 49.98),
  (2, 2, '2023-09-26', 34.99),
  (3, 3, '2023-09-27', 74.97),
  (4, 4, '2023-09-27', 24.99),
  (5, 5, '2023-09-27', 32.96);


 -- Chèn dữ liệu vào bảng OrderDetails
INSERT INTO OrderDetails (order_detail_id, order_id, beat_id, quantity, subtotal)
VALUES
  (1, 1, 1, 1, 39.98),
  (2, 2, 2, 2, 24.99),
  (3, 3, 3, 3, 74.97),
  (4, 4, 4, 4, 24.99),
  (5, 5, 5, 5, 32.96);


-- Chèn dữ liệu vào bảng Customers
INSERT INTO Customers (customer_id, name, email, password, address, phone_number)
VALUES
  (1, 'John Doe', 'john.doe@example.com', 'hashed_password_here', '123 Main St, City, Country', '123-456-7890'),
  (2, 'Jane Smith', 'jane.smith@example.com', 'hashed_password_here', '456 Elm St, City, Country', '987-654-3210'),
  (3, 'Alice Johnson', 'alice.johnson@example.com', 'hashed_password_here', '789 Oak St, City, Country', '555-123-4567'),
  (4, 'Bobby Billed', 'alice.johnson@example.com', 'hashed_password_here', '789 Oak St, City, Country', '555-124-4568'),
  (5, 'Jane Johnson', 'alice.johnson@example.com', 'hashed_password_here', '789 Oak St, City, Country', '555-123-4567');


-- Chèn dữ liệu vào bảng OnlinePayments
INSERT INTO OnlinePayments (payment_id, order_id, payment_date, payment_method, amount, transaction_id)
VALUES
  (1, 1, '2023-09-25 10:30:00', 'Credit Card', 49.98, 'transaction_id_1'),
  (2, 2, '2023-09-26 11:45:00', 'PayPal', 34.99, 'transaction_id_2'),
  (3, 3, '2023-09-27 09:15:00', 'Credit Card', 74.97, 'transaction_id_3'),
  (4, 4, '2023-09-28 11:15:00', 'Credit Card', 24.99, 'transaction_id_4'),
  (5, 5, '2023-09-28 12:15:00', 'Credit Card', 32.96, 'transaction_id_5');









