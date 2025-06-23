CREATE FUNCTION fn_CalculateOverdueFees(@LoanID INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @Fee DECIMAL(10,2) = 0;
    DECLARE @DaysOverdue INT = 0;

    SELECT @DaysOverdue = DATEDIFF(DAY, DueDate, ISNULL(DateReturned, GETDATE()))
    FROM Loans
    WHERE LoanID = @LoanID;

    IF @DaysOverdue > 0
    BEGIN
        IF @DaysOverdue <= 30
            SET @Fee = @DaysOverdue * 1;
        ELSE
            SET @Fee = (30 * 1) + ((@DaysOverdue - 30) * 2);
    END

    RETURN @Fee;
END;

SELECT dbo.fn_CalculateOverdueFees(2) AS OverdueFee;
