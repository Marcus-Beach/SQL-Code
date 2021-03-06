USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserExpiryDateSP]    Script Date: 1/20/2020 7:21:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/13/2020
-- Description:	Update User Expiry Date SP
-- =============================================
ALTER PROCEDURE [dbo].[UpdateUserExpiryDateSP](@USERID AS INT, @USEREXPIRES AS DATETIME, @TRANSID AS INT = NULL)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    UPDATE Users SET ExpiryDate = @USEREXPIRES WHERE ID = @USERID
	IF @TRANSID IS NULL
	BEGIN
		INSERT INTO Transactions(UserID, Date)
		VALUES (@USERID, GETDATE())
		SET @TRANSID = @@IDENTITY
	END
	ELSE
	BEGIN
		UPDATE Transactions SET UserID = @USERID WHERE TransactionID = @TRANSID
	END
	SELECT @TRANSID
END
