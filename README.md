# letsencrypt-s3

TODO: Short description of what this is about

## Prerequisites

Replace any instances of `example.com` with whatever domain you wish to actually use. Non-apex domains (e.g. `foo.example.com`) work fine, too.

1. Purchase `example.com` from your favorite registrar. If you already own the domain, no need to do anything.
1. Create an S3 bucket called `example.com`.
1. Enable Static Website Hosting, and set Index and Error Documents if you'd like.
1. Set up a CloudFront distribution. The important settings are (the defaults are fine for the rest):
   * Origin domain: `example.com.s3-website-eu-west-1.amazonaws.com` (make sure this matches the [website endpoint](http://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteEndpoints.html) S3 gave you in step 3)
   * Origin ID: `example.com static content`
   * Viewer Protocol Policy: HTTP and HTTPS (**for now**)
   * Alternate Domain Names: `example.com`
   * SSL Certificate: Default CloudFront Certificate (**for now**)
1. Set up a hosted zone on Route 53, with an `A` record for `example.com.` as an alias for the CloudFront distribution you just created (e.g. `foo1bar2baz3.cloudfront.net.`, the Route 53 UI will auto-complete these for you).
   * If you already have another DNS provider, go ahead and use that instead (though for apex domains you'll need [`ALIAS` record support](https://support.dnsimple.com/articles/differences-between-a-cname-alias-url/)).
   * If you're setting up a non-apex domain, regardless of DNS provider, just create a `CNAME` record pointing to your CloudFront distribution.
