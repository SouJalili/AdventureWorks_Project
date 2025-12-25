"# AdventureWorks Project" 

### Projet d'Analyse Décisionnelle AdventureWorks

Le présent dépôt centralise l'ensemble des ressources techniques et documentaires relatives au développement d'une solution de Business Intelligence basée sur l'environnement AdventureWorks. Ce projet a pour objectif principal de transformer des données transactionnelles complexes en indicateurs de performance stratégiques, permettant ainsi un pilotage optimisé des différents pôles de l'entreprise, notamment les ventes, la finance, le marketing et les ressources humaines.

La gestion de ce projet s'appuie sur la méthodologie Agile, orchestrée via la plateforme Taiga. Cette organisation a permis de segmenter le travail en sprints distincts, débutant par une phase de définition et d'exploration. Durant cette étape initiale, l'équipe a procédé à un audit rigoureux des tables sources et à la définition de cinq à dix indicateurs clés de performance par domaine métier. Cette approche garantit que les développements techniques ultérieurs répondent précisément aux besoins analytiques identifiés lors de la phase de cadrage.

Le volet technique du projet repose sur une architecture robuste privilégiant le traitement des données en amont. Le nettoyage et la transformation des données brutes sont effectués via des requêtes SQL structurées, garantissant une meilleure intégrité des données et une optimisation des performances lors de l'importation dans Power BI. Cette stratégie de préparation de données permet de déléguer la charge de calcul au serveur de base de données, facilitant ainsi la mise en œuvre du "Query Folding".

L'utilisation de GitHub comme outil de gestion de version constitue le pilier collaboratif du projet. L'ensemble des scripts de nettoyage est archivé de manière systématique dans le répertoire dédié aux scripts SQL, assurant la traçabilité des modifications et la pérennité du code. Cette centralisation permet à chaque membre de l'équipe de travailler sur une version unique et à jour des transformations, sécurisant ainsi le passage de la phase de préparation à la phase de modélisation et de visualisation finale sous Power BI.


**Serais-tu intéressé par la rédaction d'un paragraphe spécifique sur les mesures DAX que vous avez créées après avoir importé ces données nettoyées ?**
