USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserPasswordSP]    Script Date: 1/21/2020 8:53:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/20/2020
-- Description:	Update User Password SP
-- =============================================
ALTER PROCEDURE [dbo].[UpdateUserPasswordSP](@USERID AS INT, @PASSWORD AS VARCHAR(50), @TRANSID AS INT = NULL)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    UPDATE Users SET Password = @PASSWORD WHERE ID = @USERID
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
