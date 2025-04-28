-- Crear el menú personalizado para el juego South Bronx
local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = PlayerGui

-- Función para crear el menú
local function createMenu()
    local menuFrame = Instance.new("Frame")
    menuFrame.Size = UDim2.new(0.3, 0, 0.5, 0)
    menuFrame.Position = UDim2.new(0.7, 0, 0.25, 0)
    menuFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    menuFrame.Parent = ScreenGui

    -- Título del menú
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Text = "South Bronx Mod Menu"
    titleLabel.Size = UDim2.new(1, 0, 0.1, 0)
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Parent = menuFrame

    -- Función para cambiar el estado de los botones
    local function toggleButton(button, action)
        if button.BackgroundColor3 == Color3.fromRGB(50, 50, 50) then
            -- Si está apagado, lo encendemos
            button.BackgroundColor3 = Color3.fromRGB(0, 255, 0)  -- Verde para indicar activación
            action(true)  -- Llamar a la acción activada
        else
            -- Si está encendido, lo apagamos
            button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)  -- Gris para desactivado
            action(false)  -- Llamar a la acción desactivada
        end
    end

    -- Botón para autofarm NPCs
    local autofarmActive = false
    local autofarmButton = Instance.new("TextButton")
    autofarmButton.Text = "Autofarm NPCs"
    autofarmButton.Size = UDim2.new(1, 0, 0.1, 0)
    autofarmButton.Position = UDim2.new(0, 0, 0.1, 0)
    autofarmButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    autofarmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    autofarmButton.MouseButton1Click:Connect(function()
        toggleButton(autofarmButton, function(isActive)
            autofarmActive = isActive
            if autofarmActive then
                -- Iniciar autofarm NPCs
                print("Autofarm NPCs activado")
                local npc = game.Workspace:FindFirstChild("NPC") -- Reemplazar con el nombre adecuado
                if npc then
                    while autofarmActive do
                        if npc.Health > 0 then
                            npc:TakeDamage(10) -- Daño constante a los NPCs
                        end
                        wait(1)
                    end
                end
            else
                print("Autofarm NPCs desactivado")
            end
        end)
    end)
    autofarmButton.Parent = menuFrame

    -- Botón para robos automáticos (banco, ATM)
    local robberyActive = false
    local robberyButton = Instance.new("TextButton")
    robberyButton.Text = "Robo Automático"
    robberyButton.Size = UDim2.new(1, 0, 0.1, 0)
    robberyButton.Position = UDim2.new(0, 0, 0.2, 0)
    robberyButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    robberyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    robberyButton.MouseButton1Click:Connect(function()
        toggleButton(robberyButton, function(isActive)
            robberyActive = isActive
            if robberyActive then
                -- Iniciar robo automático
                print("Robo automático activado")
                local bank = game.Workspace:FindFirstChild("Bank") -- Reemplazar con el nombre del banco
                if bank then
                    -- Simular robo
                    local money = Instance.new("IntValue")
                    money.Name = "Money"
                    money.Value = 1000  -- La cantidad robada
                    money.Parent = Player.Backpack
                    print("Robo realizado con éxito")
                end
            else
                print("Robo automático desactivado")
            end
        end)
    end)
    robberyButton.Parent = menuFrame

    -- Botón para autofarmear bolsa mágica
    local magicBagActive = false
    local magicBagButton = Instance.new("TextButton")
    magicBagButton.Text = "Autofarm Bolsa Mágica"
    magicBagButton.Size = UDim2.new(1, 0, 0.1, 0)
    magicBagButton.Position = UDim2.new(0, 0, 0.3, 0)
    magicBagButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    magicBagButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    magicBagButton.MouseButton1Click:Connect(function()
        toggleButton(magicBagButton, function(isActive)
            magicBagActive = isActive
            if magicBagActive then
                -- Iniciar autofarm de bolsa mágica
                print("Autofarm Bolsa Mágica activado")
                local magicBag = game.Workspace:FindFirstChild("MagicBag") -- Reemplazar con el nombre correcto
                if magicBag then
                    local bagClone = magicBag:Clone()
                    bagClone.Parent = Player.Backpack
                    print("Bolsa mágica obtenida")
                end
            else
                print("Autofarm Bolsa Mágica desactivado")
            end
        end)
    end)
    magicBagButton.Parent = menuFrame

    -- Botón para vender automáticamente la bolsa mágica
    local sellMagicBagActive = false
    local sellMagicBagButton = Instance.new("TextButton")
    sellMagicBagButton.Text = "Vender Bolsa Mágica"
    sellMagicBagButton.Size = UDim2.new(1, 0, 0.1, 0)
    sellMagicBagButton.Position = UDim2.new(0, 0, 0.4, 0)
    sellMagicBagButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    sellMagicBagButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    sellMagicBagButton.MouseButton1Click:Connect(function()
        toggleButton(sellMagicBagButton, function(isActive)
            sellMagicBagActive = isActive
            if sellMagicBagActive then
                -- Iniciar venta de bolsa mágica
                print("Venta Bolsa Mágica activada")
                local magicBag = Player.Backpack:FindFirstChild("MagicBag") -- Buscar la bolsa en el inventario
                if magicBag then
                    -- Vender la bolsa
                    magicBag:Destroy()
                    local money = Instance.new("IntValue")
                    money.Name = "Money"
                    money.Value = 500  -- El valor por la venta de la bolsa
                    money.Parent = Player.Backpack
                    print("Bolsa mágica vendida y dinero agregado")
                end
            else
                print("Venta Bolsa Mágica desactivada")
            end
        end)
    end)
    sellMagicBagButton.Parent = menuFrame

    -- Botón para autotrabajo (ganar dinero trabajando)
    local workActive = false
    local workButton = Instance.new("TextButton")
    workButton.Text = "Autotrabajo"
    workButton.Size = UDim2.new(1, 0, 0.1, 0)
    workButton.Position = UDim2.new(0, 0, 0.5, 0)
    workButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    workButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    workButton.MouseButton1Click:Connect(function()
        toggleButton(workButton, function(isActive)
            workActive = isActive
            if workActive then
                -- Iniciar el autotrabajo
                print("Autotrabajo activado")
                while workActive do
                    -- Simular el trabajo (p.ej., recoger un objeto y entregarlo)
                    local item = game.Workspace:FindFirstChild("WorkItem") -- Reemplazar con el nombre del item de trabajo
                    if item then
                        -- Recolectar el item y darle dinero al jugador
                        local money = Instance.new("IntValue")
                        money.Name = "Money"
                        money.Value = 50  -- Dinero ganado por trabajo
                        money.Parent = Player.Backpack
                        item:Destroy()  -- Eliminar el item tras ser recogido
                        print("Dinero ganado por trabajo")
                    end
                    wait(5)  -- Esperar 5 segundos antes de la siguiente tarea
                end
            else
                print("Autotrabajo desactivado")
            end
        end)
    end)
    workButton.Parent = menuFrame
end

-- Crear el menú al iniciar
createMenu()
