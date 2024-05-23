{ ... }:
{
	networking.wireless = {
		enable = true;
		userControlled.enable = true;

		networks = {
			TeddytaNett = {
				pskRaw = "e7349c0e00a9484f30a539463d822f4c8c270af96bb685b9bf4176943f6cbdea";
			};
		};
	};
}
