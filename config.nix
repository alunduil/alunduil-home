{
  allowUnfree = true;
  allowBroken = true;

  packageOverrides =
    super:

    {
      myHaskellPackages = super.pkgs.haskellPackages.ghcWithHoogle (
        haskellPackages:

        with haskellPackages;
        [
          hindent
          hlint
        ]
      );
    };
}
