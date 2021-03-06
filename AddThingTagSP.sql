USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[UpdateThingNameSP]    Script Date: 1/21/2020 7:59:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/21/2020
-- Description:	Add Thing Tag  SP
-- =============================================
CREATE PROCEDURE [dbo].[AddThingTagSP](@USERID AS INT, @THINGID AS INT, @TAGID AS INT)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO Transactions(UserID, ThingID, TagID, Date)
	VALUES (@USERID, @THINGID, @TAGID, GETDATE())
	SELECT @@IDENTITY
END
