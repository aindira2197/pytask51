CREATE TABLE Excel_Analizi (
  ID INT PRIMARY KEY,
  Sana DATE,
  Mijoz_Nomi VARCHAR(255),
  Mahsulot_Nomi VARCHAR(255),
  Sotilgan_Miqdori INT,
  Umumiy_Narxi DECIMAL(10, 2)
);

CREATE TABLE Mahsulotlar (
  ID INT PRIMARY KEY,
  Mahsulot_Nomi VARCHAR(255),
  Narxi DECIMAL(10, 2)
);

CREATE TABLE Mijozlar (
  ID INT PRIMARY KEY,
  Mijoz_Nomi VARCHAR(255),
  Manzili VARCHAR(255)
);

INSERT INTO Mahsulotlar (ID, Mahsulot_Nomi, Narxi)
VALUES
  (1, 'Laptop', 1500.00),
  (2, 'Smartfon', 500.00),
  (3, 'Printer', 200.00),
  (4, 'Scanner', 100.00),
  (5, 'Tablet', 800.00);

INSERT INTO Mijozlar (ID, Mijoz_Nomi, Manzili)
VALUES
  (1, 'John Doe', 'New York'),
  (2, 'Jane Doe', 'Los Angeles'),
  (3, 'Bob Smith', 'Chicago'),
  (4, 'Alice Johnson', 'Houston'),
  (5, 'Mike Brown', 'Seattle');

INSERT INTO Excel_Analizi (ID, Sana, Mijoz_Nomi, Mahsulot_Nomi, Sotilgan_Miqdori, Umumiy_Narxi)
VALUES
  (1, '2022-01-01', 'John Doe', 'Laptop', 2, 3000.00),
  (2, '2022-01-05', 'Jane Doe', 'Smartfon', 1, 500.00),
  (3, '2022-01-10', 'Bob Smith', 'Printer', 3, 600.00),
  (4, '2022-01-15', 'Alice Johnson', 'Scanner', 2, 200.00),
  (5, '2022-01-20', 'Mike Brown', 'Tablet', 1, 800.00),
  (6, '2022-01-25', 'John Doe', 'Laptop', 1, 1500.00),
  (7, '2022-01-30', 'Jane Doe', 'Smartfon', 2, 1000.00),
  (8, '2022-02-01', 'Bob Smith', 'Printer', 2, 400.00),
  (9, '2022-02-05', 'Alice Johnson', 'Scanner', 1, 100.00),
  (10, '2022-02-10', 'Mike Brown', 'Tablet', 2, 1600.00);

SELECT * FROM Excel_Analizi;
SELECT * FROM Mahsulotlar;
SELECT * FROM Mijozlar;

SELECT Mijoz_Nomi, SUM(Umumiy_Narxi) AS Umumiy_Sotilgan_Mablag
FROM Excel_Analizi
GROUP BY Mijoz_Nomi
ORDER BY Umumiy_Sotilgan_Mablag DESC;

SELECT Mahsulot_Nomi, SUM(Sotilgan_Miqdori) AS Sotilgan_Miqdori
FROM Excel_Analizi
GROUP BY Mahsulot_Nomi
ORDER BY Sotilgan_Miqdori DESC;

SELECT Sana, SUM(Umumiy_Narxi) AS Kunlik_Sotilgan_Mablag
FROM Excel_Analizi
GROUP BY Sana
ORDER BY Kunlik_Sotilgan_Mablag DESC;