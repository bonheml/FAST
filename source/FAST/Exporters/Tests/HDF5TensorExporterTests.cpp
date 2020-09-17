#include <FAST/Testing.hpp>
#include <FAST/Exporters/HDF5TensorExporter.hpp>
#include <FAST/Data/Tensor.hpp>

namespace fast {

TEST_CASE("Write tensor as HDF5", "[fast][HDF5TensorExporter][HDF5]") {
	auto tensor = Tensor::New();
	TensorShape shape({32, 32, 8});
	tensor->create(shape);

	auto exporter = HDF5TensorExporter::New();
	exporter->setFilename("tensor.hd5");
	exporter->setInputData(tensor);
	exporter->update();
}

}