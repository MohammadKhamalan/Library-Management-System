CREATE PROCEDURE sp_AddNewBorrower 
    @FirstName nvarchar(100),
    @LastName nvarchar(100),
    @Email nvarchar(255),
    @DateOfBirth DATE,
    @MembershipDate DATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Borrowers WHERE Email = @Email)
    BEGIN
       PRINT 'Error: Email already exists';
        RETURN;
    END
    ELSE
    BEGIN
        INSERT INTO Borrowers (FirstName, LastName, Email, DateOfBirth, MembershipDate) 
        VALUES (@FirstName, @LastName, @Email, @DateOfBirth, @MembershipDate);
        SELECT * FROM Borrowers WHERE BorrowerID = SCOPE_IDENTITY();
    END
END;
EXEC sp_AddNewBorrower 
    @FirstName = 'Mohammad', 
    @LastName = 'Khamalan', 
    @Email = 'mohammad.khamalan@gmail.com', 
    @DateOfBirth = '2002-03-29', 
    @MembershipDate = '2025-04-16';
