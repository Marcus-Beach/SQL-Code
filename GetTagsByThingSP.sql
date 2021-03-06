USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[GetTagSP]    Script Date: 1/21/2020 7:46:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/21/2020
-- Description:	Get Tags By Thing SP
-- =============================================
CREATE PROCEDURE [dbo].[GetTagsByThingSP](@THINGID AS INT)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * FROM Tags WHERE LocalID IN (SELECT TagID FROM Transactions WHERE ThingID = @THINGID)
END