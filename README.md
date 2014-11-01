vagrant-openidm-pta
===================

It was added in OpenIDM 3.0.0, you can try the Pass-Through Authentication.   
Delegate is OpenDJ.  

# Requirements

Please be sure that you install these software.  

    VirtualBox
    Vagrant

These Vagrant Plugin Depending on the environment also will become necessary.  

    vagrant-vbguest
    vagrant-proxyconf

# Getting started

    # git clone https://github.com/demiglacesource/vagrant-openidm-pta.git && cd vagrant-openidm-pta
    # vagrant up

# Multi-Machine

vagrant-openidm-pta is made up of multiple machines.

    OpenDJ on CentOS7
    OpenIDM on CentOS7

If you want to run a "vagrant ssh", you would enter the following.

    # vagrant ssh opendj
    or
    # vagrant ssh openidm

I use the following private ip.

    OpenDJ is 192.168.55.10.
    OpenIDM is 192.168.55.11.

# Proxy setting

Change the following settings as necessary.

    # vim Vagrantfile
    [snip]
    config.proxy.http = "http://proxy.mycompany.co.jp:8080/"
    config.proxy.https = "http://proxy.mycompany.co.jp:8080/"
    [snip]

# Sample accounts

Use the sample data of OpenDJ, managed objects of 5 user worth has been registered by reconciliation.  
I lists the username and password below.

    user.0 / password
    user.1 / password
    user.2 / password
    user.3 / password
    user.4 / password

# Let's try

    # curl -u "user.0:password" "http://localhost:8080/openidm/info/login?_prettyPrint=true"
    {
      "authorizationId" : {
        "id" : "f4c1534a-ce05-4438-b05e-b599d1b8aa63",
        "component" : "managed/user",
        "roles" : [ "openidm-authorized" ]
      },
      "parent" : {
        "id" : "5faddc76-0f93-4874-8c5f-2c512968c5ad",
        "parent" : null,
        "class" : "org.forgerock.json.resource.RootContext"
      },
      "class" : "org.forgerock.json.resource.SecurityContext",
      "authenticationId" : "user.0"
    }

# Link

* http://forgerock.com/products/open-identity-stack/openidm/
* http://docs.forgerock.org/en/openidm/3.0.0/release-notes/index.html
