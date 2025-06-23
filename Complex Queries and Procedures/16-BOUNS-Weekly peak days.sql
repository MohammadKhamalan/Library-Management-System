SELECT TOP 3 
    DATENAME(weekday, DateBorrowed) AS WeekDay,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Loans) AS Percentage
FROM Loans
GROUP BY DATENAME(weekday, DateBorrowed)
ORDER BY Percentage DESC;
