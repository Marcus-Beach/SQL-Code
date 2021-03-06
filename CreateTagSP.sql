USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[CreateTagSP]    Script Date: 1/22/2020 6:39:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/06/2020
-- Description:	Create New Tag SP
-- =============================================
ALTER PROCEDURE [dbo].[CreateTagSP](@NAME AS NVARCHAR(50), @USERID AS INT)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    INSERT INTO Tags(Name)
	VALUES (@NAME)
	INSERT INTO Transactions(UserID, TagID, Date)
	VALUES (@USERID, @@IDENTITY, GETDATE())
	SELECT @@IDENTITY
END
