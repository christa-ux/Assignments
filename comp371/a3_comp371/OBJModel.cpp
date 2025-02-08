#include "OBJModel.h"
#include <iostream>
#include <fstream>
OBJModel::OBJModel(){}
OBJModel::~OBJModel() {}

void OBJModel::LoadFromfile(const char* filename) {

}
std::vector<float> OBJModel::SetVertexData() {

}
int OBJModel::GetVertexCount() {

}
void OBJModel::loadMaterialFile(const* char filename) {
	std::ifstream file(fileName);
	if (file) {
		std::string line;
		while (std::getline(file, line)) {
			char mtlName[100];
			if(StrartWith(line, ""))
		}
	}
	else {
		std::cout << "material file loading failed" << std::endl;
	}
}
bool OBJModel::StartWith(std::string& line, const char* text){}
void OBJModel::AddVertexData(int v1, int v2, int v3, const char* mt1, 
	int n1, int n2, int n3, 
	std:: vector<Position>& vertices, std::vector<Normal>& normals) {}