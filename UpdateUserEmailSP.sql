USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserEmailSP]    Script Date: 1/13/2020 7:40:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/13/2020
-- Description:	Update User Email SP
-- =============================================
ALTER PROCEDURE [dbo].[UpdateUserEmailSP](@USERID AS INT, @USEREMAIL AS VARCHAR(50), @TRANSID AS INT = NULL)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRANSACTION
    UPDATE Users SET Email = @USEREMAIL WHERE ID = @USERID
	IF @TRANSID IS NULL
	BEGIN
		SET @TRANSID = ((SELECT top 1 TransactionID from Transactions order by TransactionID desc) + 1)
		INSERT INTO Transactions(TransactionID, UserID, Date)
		VALUES (@TRANSID, @USERID, GETDATE())
	END
	ELSE
	BEGIN
		UPDATE Transactions SET UserID = @USERID WHERE TransactionID = @TRANSID
	END
	COMMIT
	SELECT @TRANSID
END
