pipeline{
      agent{
        node{
          label 'slave-pipeline'
        }
      }

      stages{
        stage('Git'){
          steps{
            git branch: 'multistage-test', credentialsId: '', url: 'https://github.com/haoshuwei/jenkins-demo.git'
          }
        }

        stage('Image Build And Publish'){
          steps{
              container("kaniko") {
                  sh "/kaniko/executor -f `pwd`/Dockerfile -c `pwd`  --skip-tls-verify  --destination=registry-vpc.cn-hongkong.aliyuncs.com/haoshuwei24/test:v1"
              }
          }
        }
      }
}
