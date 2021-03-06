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
-- Description:	Remove Thing Tag  SP
-- =============================================
CREATE PROCEDURE [dbo].[RemoveThingTagSP](@USERID AS INT, @THINGID AS INT, @TAGID AS INT)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DELETE FROM Transactions WHERE UserID = @USERID AND ThingID = @THINGID and TagID = @TAGID
END
