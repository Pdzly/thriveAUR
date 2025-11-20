git clone ssh://aur@aur.archlinux.org/thrive-bin.git || exit 1

cp PKGBUILD thrive-bin
cp thrive.sh thrive-bin

cd thrive-bin || exit 1
makepkg -sfcC --noconfirm
makepkg --printsrcinfo > .SRCINFO

current_version=$(grep "^pkgver=" PKGBUILD | cut -d'=' -f2)
current_pkgrel=$(grep "^pkgrel=" PKGBUILD | cut -d'=' -f2)


git add .
git commit -m "Updating package to ${current_version} - ${current_pkgrel}"
git push

rm -rf thrive-bin
echo "Successfully published package to AUR with the version ${current_version} - ${current_pkgrel}"