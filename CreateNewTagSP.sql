USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[CreateTagSP]    Script Date: 1/20/2020 6:30:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/06/2020
-- Description:	Create New Tag SP
-- =============================================
ALTER PROCEDURE [dbo].[CreateTagSP](@NAME AS NVARCHAR(50), @USERID AS INT, @THINGID AS INT = NULL, @FRIENDID AS INT = NULL)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    INSERT INTO Tags(Name)
	VALUES (@NAME)
	INSERT INTO Transactions(UserID, TagID, ThingID, FriendID, Date)
	VALUES (@USERID, @@IDENTITY, @THINGID, @FRIENDID, GETDATE())
	SELECT @@IDENTITY
END
