function FindProxyForURL (url, host)
{
	if (isInNet (host, "10.0.0.0", "255.0.0.0") ||
	    isInNet (host, "172.0.0.0", "255.0.0.0") ||
            isInNet (host, "127.0.0.0", "255.0.0.0"))
	    return "DIRECT";
    return "SOCKS5 127.0.0.1:58999";
}
