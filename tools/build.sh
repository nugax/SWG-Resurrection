echo "================================================"
echo "Building SWG-Resurrection core3 Server"
echo "================================================"
sleep 2

echo ""
echo ""
echo "Removing old core3 executables..."
sleep 1
cd /home/swgemu/swgserver/Core3/MMOCoreORB/bin
rm core3 
rm ccore3
rm core3client


echo ""
echo ""
echo "Building new executables..."
sleep 1
cd /home/swgemu/swgserver/Core3/MMOCoreORB
make build-cmake -j8


echo "=================================================="
echo "Creating custom build announcement"
echo "=================================================="

echo ""
echo ""

cd /home/swgemu/swgserver/Core3/MMOCoreORB/bin/conf
cp rev.txt rev_temp.txt
rm rev.txt
cat default.txt rev_temp.txt > rev.txt


cd /home/swgemu/swgserver/Core3/MMOCoreORB/bin
ls -alh


