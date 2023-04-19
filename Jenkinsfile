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
    }
    stages{
        stage('Build'){
            steps{
                echo "This image is building"
            }
        }
    }
}
