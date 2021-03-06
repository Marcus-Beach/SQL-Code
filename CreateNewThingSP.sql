USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[CreateThingSP]    Script Date: 1/20/2020 6:35:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/06/2020
-- Description:	Create New Thing SP
-- =============================================
ALTER PROCEDURE [dbo].[CreateThingSP](@NAME AS NVARCHAR(50), @USERID AS INT)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    INSERT INTO Things(Name)
	VALUES (@NAME)
	INSERT INTO Transactions(UserID, ThingID, Date)
	VALUES (@USERID, @@IDENTITY, GETDATE())
	SELECT @@IDENTITY
END
