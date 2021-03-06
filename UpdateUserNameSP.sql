USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserNameSP]    Script Date: 1/21/2020 6:24:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/09/2020
-- Description:	Update User Name SP
-- =============================================
ALTER PROCEDURE [dbo].[UpdateUserNameSP](@USERID AS INT, @USERNAME AS VARCHAR(50), @TRANSID AS INT = NULL)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    UPDATE Users SET Name = @USERNAME WHERE ID = @USERID
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
