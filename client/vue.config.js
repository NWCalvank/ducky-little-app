module.exports = {
    pluginOptions: {
      s3Deploy: {
        awsProfile: 'default',
        region: 'us-west-2',
        bucket: 'nwcalvank-1',
        createBucket: false,
        staticHosting: true,
        staticIndexPage: 'index.html',
        staticErrorPage: 'index.html',
        assetPath: 'dist',
        assetMatch: '**',
        deployPath: '/',
        acl: 'public-read',
        pwa: false,
        enableCloudfront: true,
        cloudfrontId: 'E1B2E9XFN95IQ8',
        cloudfrontMatchers: '/*',
        uploadConcurrency: 5,
        pluginVersion: '3.0.0'
      }
    }
}
