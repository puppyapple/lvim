local dap = require "dap"
dap.adapters.python = {
  type = "executable";
  command = "/home/puppyapple/anaconda3/envs/py38/bin/python"; -- os.getenv("CONDA_PYTHON_EXE");
  args = { "-m", "debugpy.adapter" }
}
dap.configurations.python = {
  {
    type = "python",
    request = "launch";
    name = "Launch file";
    program = "${file}";
    pythonPath = "/home/puppyapple/anaconda3/envs/py38/bin/python"
  }
}
