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
                  sh "kaniko -f `pwd`/Dockerfile -c `pwd` --destination=${ORIGIN_REPO}/${REPO}:${IMAGE_TAG} --skip-tls-verify"
                  sh "/kaniko/executor -f `pwd`/Dockerfile -c `pwd` --insecure --skip-tls-verify --cache=true --destination=registry-vpc.cn-hongkong.aliyuncs.com/haoshuwei24/test"
              }
          }
        }
      }
}
