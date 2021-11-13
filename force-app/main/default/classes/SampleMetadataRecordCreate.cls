public class SampleMetadataRecordCreate{
    public static void updateAndDeployMetadata() {
      // Setup custom metadata to be created in the subscriber org.
      Metadata.CustomMetadata customMetadata =  new Metadata.CustomMetadata();
      String shortRandom = generateRandomString(8);
      customMetadata.fullName = 'Sample_Type.Sample_'+shortRandom;
      customMetadata.label = 'Sample '+shortRandom;
    
      Metadata.CustomMetadataValue customField = new Metadata.CustomMetadataValue();
      customField.field = 'Sample_Text_Field__c';
      customField.value = 'New value '+generateRandomString(20);
  
      customMetadata.values.add(customField);
  
      Metadata.DeployContainer mdContainer = new Metadata.DeployContainer();
      mdContainer.addMetadata(customMetadata);
  
      
      SampleMetadataDeployCallback callback = new SampleMetadataDeployCallback();
  
      // Enqueue custom metadata deployment
      Id jobId = Metadata.Operations.enqueueDeployment(mdContainer, callback);
    }

    private static String generateRandomString(Integer len) {
        final String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz';
        String randStr = '';
        while (randStr.length() < len) {
           Integer idx = Math.mod(Math.abs(Crypto.getRandomInteger()), chars.length());
           randStr += chars.substring(idx, idx+1);
        }
        return randStr; 
    }
  }