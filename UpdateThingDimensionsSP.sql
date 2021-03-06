USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[UpdateThingDimensionsSP]    Script Date: 1/20/2020 6:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/13/2020
-- Description:	Update Thing Dimensions SP
-- =============================================
ALTER PROCEDURE [dbo].[UpdateThingDimensionsSP](@USERID AS INT, @THINGID AS INT, @UOM AS INT, @WIDTH AS FLOAT, @HEIGHT AS FLOAT, @TRANSID AS INT = NULL)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    UPDATE Things
	SET UOM = @UOM, Width = @WIDTH, Height = @HEIGHT WHERE LocalID = @THINGID
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
