pipeline
{
    agent {
        label 'OneS'
    }
    
    environment {
        envString = 'true'
    }
 
    post {
        always {
            bat "echo always"
        }
    
        failure {
            bat "echo failure"
        }
        
        success {
            bat "echo success"      
        }
    }
    stages {
        stage("stage") {
            steps {
                bat " echo Сообщение из steps"
                bat " echo переменная envString = ${envString}"

                script {
                    scannerHome = tool "sonar-scanner"
                }
            }
        }
    }
}
