#include <vector>
#include <map>
#include <string>


class OBJModel {
public: 
	OBJModel();
	~OBJModel(); 
	void LoadFromfile(const char* filename);
	std::vector<float> SetVertexData();
	int GetVertexCount();

private: 
	struct Position { float x, y, z; };
	struct Color { float r, g, b; };
	struct Normal { float x, y, z; };

	void loadMaterialFile(const char* filename);
	void StartWith(std::string line, const char* text);
	void AddVertexData(int v1, int v2, int v3, 
		const char* mt1, int n1, int n2, int n3,
		std::vector <Position>& vertices, std::vector<Normal>& normals);
	std::map<std::string, Color> materialMap;
	std::vector <float> nVertexData;
};