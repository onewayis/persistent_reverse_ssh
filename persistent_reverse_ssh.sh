createTunnel()
{
    /usr/bin/ssh -f -N -L8822:DESTINATION:22 -R7000:localhost:22 tunnel@SOURCE
    if [[ $? -eq 0 ]]
    then
        echo "Tunnel to 192.168.248.201 created successfully"
        else
        echo "An error occurred creating a tunnel to 192.168.248.201 RC was $?"
    fi

# Run the 'ls' command remotely.  If it returns non-zero, then create a new connection
/usr/bin/ssh -p 8822 localhost ls
if [[ $? -ne 0 ]]
then
    echo Creating new tunnel connection
    createTunnel
fi
