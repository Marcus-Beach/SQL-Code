USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[UpdateThingPublicImageSP]    Script Date: 1/20/2020 7:03:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/13/2020
-- Description:	Update Thing Public Image SP
-- =============================================
ALTER PROCEDURE [dbo].[UpdateThingPublicImageSP](@USERID AS INT, @THINGID AS INT, @PUBLICIMAGE AS NVARCHAR(50), @TRANSID AS INT = NULL)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    UPDATE Things
	SET PublicImage = @PUBLICIMAGE WHERE LocalID = @THINGID
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
