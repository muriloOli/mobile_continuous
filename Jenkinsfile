pipeline{
    agent {
        docker {
            image 'qaninja/rubywd'
        }
        triggers {
        cron('0 12 * * 1-5')
        }
    }
    
    stages{
        stage('Biuld'){
            steps {
                echo 'Biulding or Resolve Dependencies!'
                sh 'rm -f Gemfile.lock'
                sh 'bundle install'
            }
            
        }
        stage('Test'){
            steps {
                echo 'Running Regression Test!'
                sh 'rake run_acceptance[android,@doing]'
            }
            post {
                always {
                    cucumber failedFeaturesNumber: -1, failedScenariosNumber: -1, failedStepsNumber: -1, fileIncludePattern: '**/*.json', jsonReportDirectory: 'reports', pendingStepsNumber: -1, skippedStepsNumber: -1, sortingMethod: 'ALPHABETICAL', undefinedStepsNumber: -1
                }
            }
        }
        stage('UAT'){
            steps {
                echo 'Wait for User Acceptance'
                input(message:'Go to Prod?', ok: 'Yes')
            }
        }
        stage('Production'){
            steps {
                echo 'Application is Ready!'
            }
        }
    }
}
