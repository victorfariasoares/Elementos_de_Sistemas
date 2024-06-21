from cocotb_test.simulator import run
import pytest
import os

from telemetry import telemetryMark
pytestmark = telemetryMark()


def source(name):
	dir = os.path.dirname(__file__)
	src_dir = os.path.join(dir, 'src' )
	return os.path.join(src_dir, name)


@pytest.mark.telemetry_files(source('controlunit.vhd'))
def test_controlunit():
    run(vhdl_sources=[source("controlunit.vhd")], toplevel="controlunit", module="CPU_cocotb" , testcase='tb_ControlUnit', toplevel_lang="vhdl")

@pytest.mark.telemetry_files(source('memoryio.vhd'),source('.Dispositivos/screen.vhd'),source('.Dispositivos/ram16k.vhd'),source('../../b_logComb/src/mux4way16.vhd'),source('../../d_logSeq/src/register16.vhd'))
def test_memoryio():
    run(vhdl_sources=[source('memoryio.vhd'),source('.Dispositivos/screen.vhd'),source('.Dispositivos/ram16k.vhd'),source('../../b_logComb/src/mux4way16.vhd'),source('../../d_logSeq/src/register16.vhd')], toplevel="memoryio", module="CPU_cocotb" , testcase='tb_MemoryIO', toplevel_lang="vhdl")

@pytest.mark.telemetry_files(source('cpu.vhd'),source('controlunit.vhd'),source('../../b_logComb/src/mux16.vhd'),source('../../c_ULA/src/alu.vhd'),source('../../d_logSeq/src/register16.vhd'),source('../../d_logSeq/src/pc.vhd'),source('../../d_logSeq/src/register8.vhd'),source('../../d_logSeq/src/binarydigit.vhd'),source('../../d_logSeq/src/flipflopd.vhd'),source('../../b_logComb/src/mux2way.vhd'),source("../../c_ULA/src/zerador16.vhd"), source("../../c_ULA/src/inversor16.vhd"), source("../../c_ULA/src/add16.vhd"), source("../../c_ULA/src/fulladder.vhd"), source("../../b_logComb/src/and16.vhd"), source("../../c_ULA/src/comparador16.vhd"),source("../../c_ULA/src/inc16.vhd"))
def test_cpu():
    run(vhdl_sources=[source('cpu.vhd'),source('controlunit.vhd'),source('../../b_logComb/src/mux16.vhd'),source('../../c_ULA/src/alu.vhd'),source('../../d_logSeq/src/register16.vhd'),source('../../d_logSeq/src/pc.vhd'),source('../../d_logSeq/src/register8.vhd'),source('../../d_logSeq/src/binarydigit.vhd'),source('../../d_logSeq/src/flipflopd.vhd'),source('../../b_logComb/src/mux2way.vhd'),source("../../c_ULA/src/zerador16.vhd"), source("../../c_ULA/src/inversor16.vhd"), source("../../c_ULA/src/add16.vhd"), source("../../c_ULA/src/fulladder.vhd"), source("../../b_logComb/src/and16.vhd"), source("../../c_ULA/src/comparador16.vhd"),source("../../c_ULA/src/inc16.vhd")], toplevel="cpu", module="CPU_cocotb" , testcase='tb_CPU', toplevel_lang="vhdl")


if __name__ == "__main__":
    test_controlunit()
    test_memoryio()
    test_cpu()

