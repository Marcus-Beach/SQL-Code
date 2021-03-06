USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserNameSP]    Script Date: 1/20/2020 8:25:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/20/2020
-- Description:	Delete User SP
-- =============================================
CREATE PROCEDURE [dbo].[DeleteUserSP](@USERID AS INT, @TRANSID AS INT)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    DELETE FROM Users WHERE ID = @USERID
	IF @TRANSID = NULL
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
