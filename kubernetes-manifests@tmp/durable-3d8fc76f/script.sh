
                                    git config user.email "b4shailen@gmail.com"
                                    git config user.name "Shailendra Singh"
                                    BUILD_NUMBER=${BUILD_NUMBER}
                                    sed -i "s/replaceImageTag/${BUILD_NUMBER}/g" /var/lib/jenkins/workspace/CMU-Mono-Repo/kubernetes-manifests/deploy_adservice.yaml
                                    git add /var/lib/jenkins/workspace/CMU-Mono-Repo/kubernetes-manifests/deploy_adservice.yaml
                                    # Stage changes
                                    git add --all
                                    # Check for untracked files
                                    untracked=$(git ls-files --others --exclude-standard)
                                    if [ ! -z "$untracked" ]; then
                                        # If there are untracked files, add them
                                        git add "$untracked"
                                    fi
                                    # Commit changes
                                    git commit -m "Update deployment image to version ${BUILD_NUMBER}"
                                    # Push changes
                                    git push https://${GITHUB_TOKEN}@github.com/${GIT_USER_NAME}/${GIT_REPO_NAME} HEAD:main
                                