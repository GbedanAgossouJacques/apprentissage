# Spécifiez la version minimale de CMake nécessaire
cmake_minimum_required(VERSION 3.0)

# Nommez votre projet
project(my_lapack_project)

# Spécifiez le compilateur Fortran
enable_language(Fortran)

# Recherchez la bibliothèque LAPACK
find_package(LAPACK REQUIRED)

# Ajoutez les fichiers source de votre projet
add_executable(my_lapack my_lapack.f90)

# Ajoutez les bibliothèques à lier
target_link_libraries(my_lapack PRIVATE ${LAPACK_LIBRARIES})
