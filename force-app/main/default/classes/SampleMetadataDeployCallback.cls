public with sharing class SampleMetadataDeployCallback implements Metadata.DeployCallback{
    public void handleResult(Metadata.DeployResult var1, Metadata.DeployCallbackContext var2) {
        System.debug('Done!');
    }
}
