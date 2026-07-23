from prophecy_pipeline_sdk.graph import *
from prophecy_pipeline_sdk.properties import *
args = PipelineArgs(label = "Error_Check", version = 1, auto_layout = False)

with Pipeline(args) as pipeline:
    error_check__multicolumnedit_1 = Process(
        name = "Error_Check__MultiColumnEdit_1",
        properties = ModelTransform(modelName = "Error_Check__MultiColumnEdit_1"),
        input_ports = ["in_0", "in_1", "in_2", "in_3", "in_4"]
    )

