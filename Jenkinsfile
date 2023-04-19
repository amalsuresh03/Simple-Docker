pipeline{
    agent any
    stages{
        stage('Clean'){
            steps{
                script{
                    sh '''
                        docker version
                    '''
                }
            }
        }
        stage('Build'){
            steps{
                script{
                    def image = docker.build("html-image:latest")
                }
            }
        }
        stage('Store and deploy'){
            steps{
                script{
                    sh '''
                        docker images
                        docker save html-image:latest -o html-image:latest.tgz
                        ls -sh html-image:latest.tgz
                        chmod 777 html-image:latest.tgz
                        docker run -it -d --name html-image-container -p 9000:80 html-image
                    '''
                }
            }
        }
    }
}
