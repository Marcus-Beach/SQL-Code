USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[CreateThingSP]    Script Date: 1/13/2020 8:18:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/13/2020
-- Description:	Update Thing Name SP
-- =============================================
ALTER PROCEDURE [dbo].[UpdateThingNameSP](@USERID AS INT, @THINGID AS INT, @NAME AS NVARCHAR(50), @TRANSID AS INT = NULL)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRANSACTION
    UPDATE Things
	SET Name = @NAME
	IF @TRANSID IS NULL
	BEGIN
		SET @TRANSID = ((SELECT top 1 TransactionID from Transactions order by TransactionID desc) + 1)
		INSERT INTO Transactions(TransactionID, UserID, ThingID, Date)
		VALUES (@TRANSID, @USERID, @THINGID, GETDATE())
	END
	ELSE
	BEGIN
		UPDATE Transactions SET UserID = @USERID, ThingID = @THINGID WHERE TransactionID = @TRANSID
	END
	COMMIT
	SELECT @TRANSID
END
