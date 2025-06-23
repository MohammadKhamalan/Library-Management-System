CREATE INDEX idx_BookID ON Books (BookID);
CREATE INDEX idx_Book_Authors ON Books (Author);
CREATE INDEX idx_Book_Title ON Books (Title);

CREATE INDEX idx_BorrowerID ON Borrowers (BorrowerID);
CREATE UNIQUE INDEX idx_Borrower_Email ON Borrowers (Email);

CREATE INDEX idx_LoanId ON Loans(LoanId);
CREATE INDEX idx_BookId ON Loans(BookId);
CREATE INDEX idx_BorrowerId ON Loans(BorrowerID);
CREATE INDEX idx_Loan_DateBorrowed ON Loans (DateBorrowed);
CREATE INDEX idx_Loan_DateReturned_DueDate ON Loans (DateReturned, DueDate);
CREATE INDEX idx_Loan_BorrowerID_DateReturned ON Loans (BorrowerID, DateReturned);
CREATE NONCLUSTERED INDEX idx_Loans_DateReturned_BorrowerID ON Loans (DateReturned) INCLUDE (BorrowerID);
CREATE NONCLUSTERED INDEX idx_Loans_Month_BookID ON Loans(DateBorrowed) INCLUDE (BookID);
CREATE NONCLUSTERED INDEX idx_Loans_BookID_DateBorrowed ON Loans(BookID, DateBorrowed);


