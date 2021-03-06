USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[UpdateThingPositionSP]    Script Date: 1/20/2020 6:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/13/2020
-- Description:	Update Thing Position SP
-- =============================================
ALTER PROCEDURE [dbo].[UpdateThingPositionSP](@USERID AS INT, @THINGID AS INT, @XPOS AS FLOAT, @YPOS AS FLOAT, @ORIENT AS FLOAT, @TRANSID AS INT = NULL)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    UPDATE Things
	SET Xpos = @XPOS, Ypos = @YPOS, Orientation = @ORIENT WHERE LocalID = @THINGID
	IF @TRANSID IS NULL
	BEGIN
		INSERT INTO Transactions(UserID, ThingID, Date)
		VALUES (@USERID, @THINGID, GETDATE())
		SET @TRANSID = @@IDENTITY
	END
	ELSE
	BEGIN
		UPDATE Transactions SET UserID = @USERID, ThingID = @THINGID WHERE TransactionID = @TRANSID
	END
	SELECT @TRANSID
END
