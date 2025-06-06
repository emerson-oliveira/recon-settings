[ -f $HOME/.config/zsh/functions.zsh ] && source $HOME/.config/zsh/functions.zsh

wellRecon() {
  wellSubRecon
  # subPermutation
  naabuRecon
  getalive
  dnsrecords
  wellNuclei
}

ReconRedbull() {
  naabuRecon
  getalive
  dnsrecords
  graphqldetect
  nucTakeover
  nucPanel
  XssScan
  OpenRedirectScan
  exposureNuc
}

swaggerRecon() {
  subdomainenum
  getalive
  swaggerUIdetect
}

wellNuclei() {
  updateTemplatesNuc
  jiraScan
  nucTakeover
  graphqldetect
  swaggerUIdetect
  GitScan
  panelNuc
  exposureNuc
}

wellCustonNuc() {
  jiraScan
  nucTakeover
  swaggerUIdetect
}

newRecon() {
  subdomainenum
  [ -s "asn" ] && cat asn | metabigor net --asn | anew cidr
  [ -s "cidr" ] && cat cidr | anew clean.subdomains
  naabuRecon
  getalive
  dnsrecords
  updateTemplatesNuc
  nucTakeover
  graphqldetect
  APIRecon
  swaggerUIdetect
  ssrfdetect
  XssScan
  OpenRedirectScan
  GitScan
  nucauto
}

initialRecon() {
  # Fase 1: Descoberta de superfície
  echo "⚡ Iniciando Descoberta de superfície"
  subdomainenum
  [ -s "asn" ] && cat asn | metabigor net --asn | anew cidr
  [ -s "cidr" ] && cat cidr | anew clean.subdomains
  #brutesub
  
  # Fase 2: Descoberta de serviços e DNS
  echo "⚡ Iniciando Descoberta de serviços e DNS"

  naabuRecon
  getalive
  dnsrecords
  
  echo "⚡ Reconhecimento inicial concluído. Execute advancedDetection para iniciar a detecção avançada."
}

advancedDetection() {
  # Fase 1: Atualização e preparação
  echo "⚡ Iniciando Atualização e preparação"

  updateTemplatesNuc
  echo "⚡ Atualização e preparação concluída."
  # Fase 2: Detecção de painéis e exposições
  echo "⚡ Iniciando Detecção de painéis e exposições"
  jiraScan
  panelNuc
  exposureNuc
  
  # Fase 3: Detecção de vulnerabilidades específicas
  echo "⚡ Iniciando Detecção de vulnerabilidades específicas"
  nucTakeover
  graphqldetect
  APIRecon
  swaggerUIdetect
  ssrfdetect
  XssScan
  OpenRedirectScan
  GitScan
  echo "⚡ Detecção de vulnerabilidades específicas concluída."
  # Fase 4: Automação final
  echo "⚡ Iniciando Automação final"
  nucauto
  
  echo "🔍 Detecção avançada concluída."
}

completeRecon() {
  initialRecon
  advancedDetection
}

wordpressRecon(){
  for domain in $(cat $1); do
   nuclei -u $domain -t /home/blindex/nuclei-wordfence-cve/nuclei-templates -o wordpress && [ -s "wordpress" ] && notify -silent -id nuclei -data wordpress
  done
}