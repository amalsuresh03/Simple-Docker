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
                        docker rmi $(docker images -f dangling=true -q)
                        if [ $( docker ps -a | grep html-image-container | wc -l ) -gt 0 ]; then
                          echo "Container exists"
                          if [ $( docker ps -a | grep html-image-container | wc -l ) -gt 0 ]; then
                            echo "Container is running - Stopping it"
                            docker stop html-image-container
                          fi
                          echo "Removing the container"
                          docker rm html-image-container
                        fi
                        echo "Creating the container"

                        docker run -it -d --name html-image-container -p 9000:80 html-image
                    '''
                }
            }
        }
    }
}
