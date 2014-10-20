application = 
{
	showRuntimeErrors = true,
	content = 
	{
		fps = 60,
		width = 720,
		height = 1280,
		scale = "zoomEven",
		xAlign = "center",
        yAlign = "center",

		imageSuffix = 
		{
			["@2x"] = 1.5
			--high-resolution devices (Retina iPad, Kindle Fire HD 9", Nexus 10, etc.) will use @2x-suffixed images
			--devices less than 1200 pixels in width (iPhone4, iPad2, Kindle Fire 7", etc.) will use non-suffixed images
		}
	}
}