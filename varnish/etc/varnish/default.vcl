# This is an example VCL file for Varnish.
#
# It does not do anything by default, delegating control to the
# builtin VCL. The builtin VCL is called when there is no explicit
# return statement.
#
# See the VCL chapters in the Users Guide for a comprehensive documentation
# at https://www.varnish-cache.org/docs/.

# Marker to tell the VCL compiler that this VCL has been written with the
# 4.0 or 4.1 syntax.
vcl 4.1;

# Default backend definition. Set this to point to your content server.
backend default {
    .host = "phpload.ant.local";
    .port = "80";
}

sub vcl_recv {
    # Vérifier si la page est déjà en cache
    if (req.url ~ "^/$") {
        return (hash);
    }

    # Règles de mise en cache par défaut
    return (hash);
}
