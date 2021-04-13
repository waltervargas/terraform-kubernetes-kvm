resource "libvirt_network" "k8s" {
  # the name used by libvirt
  name = "dev.k8s.local"

  # autostart this network
  autostart = true

  # mode can be: "nat" (default), "none", "route", "bridge"
  mode = "route"

  #  the domain used by the DNS server in this network
  domain = "dev.k8s.local"

  # list of subnets the addresses allowed for domains connected
  # also derived to define the host addresses
  # also derived to define the addresses served by the DHCP server
  addresses = ["10.241.0.0/24"]

  # (optional) the bridge device defines the name of a bridge device
  # which will be used to construct the virtual network.
  # (only necessary in "bridge" mode)
  # bridge = "br7"

  # (optional) the MTU for the network. If not supplied, the underlying device's
  # default is used (usually 1500)
  # mtu = 9000

  # (Optional) DNS configuration
  dns {
    # (Optional, default false)
    # Set to true, if no other option is specified and you still want to
    # enable dns.
    enabled = true
    # (Optional, default false)
    # true: DNS requests under this domain will only be resolved by the
    # virtual network's own DNS server
    # false: Unresolved requests will be forwarded to the host's
    # upstream DNS server if the virtual network's DNS server does not
    # have an answer.
    local_only = true

    # (Optional) one or more DNS forwarder entries.  One or both of
    # "address" and "domain" must be specified.  The format is:
    forwarders {
      address = "192.168.0.254"
      domain  = "home.walter.bio"
    }


    # (Optional) one or more DNS host entries.  Both of
    # "ip" and "hostname" must be specified.  The format is:
    hosts {
      hostname = "etcd1"
      ip       = "10.241.0.11"
    }
    # hosts {
    #     hostname = "my_hostname"
    #     ip = "my.ip.address.2"
    #   }
    #

  }

  routes {
    cidr    = "192.168.0.0/24"
    gateway = "10.241.0.1"
  }
}
